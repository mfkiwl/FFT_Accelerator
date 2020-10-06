
`timescale 1 ns / 1 ps

`define DefaultW 32

`define PI 3.1415926535

// Taylor expansion of sin, gives a useful approximation in the range [0.0, `PI / 2.0]
`define rawSin(x) (x - ((x) ** 3) / 6.0 + ((x) ** 5) / 120.0)

// Piecewise definition of sine
`define sin(x) (((x) <= `PI * 0.5) ? `rawSin(x) :                  \
                ((x) <= `PI)       ? `rawSin(`PI - (x)) :          \
                ((x) <= `PI * 1.5) ? -`rawSin((x) - `PI) :         \
                ((x) <= `PI * 2.0) ? -`rawSin(`PI * 2.0 - (x)) :   \
                                     `rawSin((x) - `PI * 2.0))

// Definition of cosine in terms of sine
`define cos(x) `sin(x + `PI * 0.5)

	module FFTBRNC_v1_0 #
	(
		// Users to add parameters here
        parameter integer N    = 1024,
        parameter W = `DefaultW,
        parameter size = 1024,
        
        localparam n = 10,
        localparam ts = 2*size,
        // User parameters ends
        
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32,

		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32,
		parameter integer C_M00_AXIS_START_COUNT	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  s00_axis_aclk,
		input wire  s00_axis_aresetn,
		output wire  s00_axis_tready,
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,

		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_aclk,
		input wire  m00_axis_aresetn,
		output wire  m00_axis_tvalid,
		output wire [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready
	);
// Instantiation of Axi Bus Interface S00_AXIS
	FFTBRNC_v1_0_S00_AXIS # ( 
		.C_S_AXIS_TDATA_WIDTH(C_S00_AXIS_TDATA_WIDTH)
	) FFTBRNC_v1_0_S00_AXIS_inst (
		.S_AXIS_ACLK(s00_axis_aclk),
		.S_AXIS_ARESETN(s00_axis_aresetn),
		.S_AXIS_TREADY(s00_axis_tready),
		.S_AXIS_TDATA(s00_axis_tdata),
		.S_AXIS_TSTRB(s00_axis_tstrb),
		.S_AXIS_TLAST(s00_axis_tlast),
		.S_AXIS_TVALID(s00_axis_tvalid)
	);

// Instantiation of Axi Bus Interface M00_AXIS
	FFTBRNC_v1_0_M00_AXIS # ( 
		.C_M_AXIS_TDATA_WIDTH(C_M00_AXIS_TDATA_WIDTH),
		.C_M_START_COUNT(C_M00_AXIS_START_COUNT)
	) FFTBRNC_v1_0_M00_AXIS_inst (
		.M_AXIS_ACLK(m00_axis_aclk),
		.M_AXIS_ARESETN(m00_axis_aresetn),
		.M_AXIS_TVALID(m00_axis_tvalid),
		.M_AXIS_TDATA(m00_axis_tdata),
		.M_AXIS_TSTRB(m00_axis_tstrb),
		.M_AXIS_TLAST(m00_axis_tlast),
		.M_AXIS_TREADY(m00_axis_tready)
	);

	// Add user logic here
    reg busy;              // Accelerator is busy computing
    reg item_done;         // one item of the result matrix is ready
    reg matrix_done;       // the whole result matrix is ready
    reg start_transfer;    // start of transferring the result matrix back to the PS
    reg transfer;          // accelerator is transferring the results back
    reg last_transfer;     // last item of the result being transferred
    reg mac_enable;        // mac register will be updated with the value of multiply-and-add
    
    reg [W - 1 : 0] timeSeries [0 : ts - 1]; //input data
    reg [W - 1 : 0] freqSeries [0 : ts - 1]; //output data
    reg [W - 1 : 0] outputdata; //output sent to m00_axis_data
    reg [0 : W - 1] addr_stream_in;    // address used to fill in input matrix
    reg [0 : W - 1] addr_stream_out;    // address used to fill in input matrix
    
    reg [0 : C_M00_AXIS_TDATA_WIDTH - 1] op_data;   // result matrix read-out
    
    assign s00_axis_tready = !busy && !transfer;
    
    always @ (posedge s00_axis_aclk) begin
        if (!s00_axis_aresetn || s00_axis_tlast || busy)
            addr_stream_in <= 0;
        else if (s00_axis_tready && s00_axis_tvalid) // TODO: When should the address change? refer to the AXI-Stream Slave protocol and the control flags.
            addr_stream_in <= addr_stream_in + 1; // TODO: what should the next address be?
    end
      
    //Receiving data
    always @ (posedge s00_axis_aclk) begin 
        if (s00_axis_tready && s00_axis_tvalid && !busy) // TODO: write-enable signal; when should we write to the matrix A? refer to the AXI-Stream Slave protocol and the control flags.
            timeSeries [addr_stream_in] <= s00_axis_tdata;   
        if(addr_stream_in == size - 1)
            busy <= 1;     
    end
    
    //begin FFT
    reg [W - 1 : 0] ipdata [0 : ts - 1];      //Cannot perform sequential assignemnts to wire
    reg [W - 1 : 0] opdata [0 : ts - 1];      //Cannot perform sequential assignemnts to wire

    reg brdone;
    reg matrixdone;
    
    wire [W - 1 : 0] optemp [0:ts - 1];     //output of a module cannot be a reg
    wire [W - 1 : 0] tmp [0:ts - 1];     //output of a module cannot be a reg
    
    reg [0:11] j, s, k, h, b;
    reg [0:1] w, wm, t, u;
    
    integer m , m2;
    
    //Begin Bit Reversal
    
    reg [W - 1:0] bin [0: n - 1];
    reg [W - 1:0] tmpr;
    integer p, v; //ifc1, ifc2, elc1, elc2;
    
    reg val, base; // for obtaining the value from the revesed bits
    
    always@(posedge s00_axis_aclk) begin
        if(busy) begin
            for(h = 0; h < size; h = h + 1) begin
            
                tmpr = h;
                val = 0;
                base = 1;
            
                for(p = 0; p < n; p = p + 1) begin
                    bin[p] = (tmpr & 1'h1) ? 1 : 0;
                    tmpr = tmpr >> 1;    
                end
            
                for(v = 0; v < n; v = v + 1) begin           
                    val = val + bin[v] * base;
                    base = base * 2;             
                end
            
            //Bit-Reversal done
                freqSeries[val] = timeSeries [h];
            end
            brdone = 1;
        end
    end
    
    

    always@(posedge s00_axis_aclk) begin
        
        if(brdone && busy) begin
            for (s=0; s < ts; s = s + 1)begin
                opdata[s] = optemp[s];
            end
        
            for (s = 1; s <= n; s = s + 1) begin
           
                m = 1 << s;
                m2 = (1 << s) >> 1;
                
                w = {1'd1, 1'd0}; 
            
                wm[0] = `cos(`PI/m2); //real
                wm[1] = `sin(-1*`PI/m2); //imag
            
            
                for (j = 0; j < m2; j = j + 1) begin
                    for (k = j; k < W; k = k + m) begin
                    
                        t[0] = w[1] * opdata[k + m2];
                        t[1] = w[0] * opdata[k + m2 + W];
                    
                        u[0] = opdata[k];
                        u[1] = opdata[k + W];
                    
                        opdata[k] = u[0] + t[0];
                        opdata[k + W] = u[1] + t[1];
                              
                        opdata[k + m2] = u[0] - t[0];
                        opdata[k + m2 + W] = u[1] - t[1];
                                        
                    end
                
                    w[0] = w[0] * wm[0];
                    w[1] = -1 *  w[1] * wm[1];
                
                end
            end
           
            for (s = 0; s < ts; s = s + 1) begin
                freqSeries[s] = opdata[s];
            end
        
            matrixdone = 1;
            busy = 0;
            brdone = 0;
        end
        
    end    
    //end FFT
    
    assign m00_axis_tstrb = 4'hf;   // always f; byte-enable signal;
    assign m00_axis_tdata = op_data;       // TODO: where do the stream-out data (result) come from?
    assign m00_axis_tlast = last_transfer;       // TODO: when should we set the signal for the last stream-out? refer to the control flags;
    assign m00_axis_tvalid = transfer;      // TODO: when are the stream-out data valid? refer to the control flags;
    
    always @ (posedge m00_axis_aclk) begin
            if (!s00_axis_aresetn || last_transfer) // TODO: when should we reset the stream-out address? refer to the control flags;
                addr_stream_out <= 0;
            else if ((start_transfer || transfer) && m00_axis_tready && !busy) // TODO: When should the address change? refer to the AXI-Stream Master protocol and the control flags.
               addr_stream_out <= addr_stream_out + 1; // TODO: what should the next address be?
    end
        
    // Start the transfer of the results to the PS
    always @ (posedge m00_axis_aclk) begin
        if (!s00_axis_aresetn)
            start_transfer <= 0;
        else
            start_transfer <= matrix_done; // TODO: refer to the control signals; this signal shall be asserted for one clock cycle.
    end
        
    // Accelerator is busy transferring the results back to the PS
    always @ (posedge m00_axis_aclk) begin
        if (!s00_axis_aresetn || last_transfer) // TODO: when to reset? refer to the control signals.
            transfer <= 0;
        else if (start_transfer)  // TODO: refer to the control signals; this signal shall remain asserted while transferring the results.
            transfer <= 1;
    end
        
    // Transferring the last result
    always @ (posedge m00_axis_aclk) begin
        if (!s00_axis_aresetn)
            last_transfer <= 0;
        else
            last_transfer <= addr_stream_out == ts - 1; // TODO: this signal should be asserted for one clock cycle when transferring the last address.
    end
        
    // Result matrix BRAM
    always @ (posedge m00_axis_aclk) begin
        if ((start_transfer || transfer) && m00_axis_tready && !last_transfer) // TODO: read-enable signal; when should we read from the result matrix? refer to the AXI-Stream Master protocol and the control flags.
            op_data <= freqSeries [addr_stream_out];
        if( addr_stream_out == ts - 1)
            matrix_done <= 0;    
    end
    
    // User logic ends
	endmodule
