module testbench;

parameter cnt_width = 4;
parameter depth = 9;
parameter word = 8;
reg clk, en, clr;
reg in, rst, ready;
  
reg[word-1 :0] din;

bit[cnt_width-1: 0] count;
bit out, done;
bit[depth-1 :0] dout;

up_counter #(cnt_width) upc_inst(.en(en), .clr(clr), .count(count), .clk(clk));

initial begin
  clk = 0;
  en = 0;
  clr = 0;
  in = 0;
  ready = 1;
  
fork
  forever begin
    clr = $urandom();
    #400;
  end
  forever begin
    en = $urandom();
    clr = $urandom();
    #200;
  end
  forever begin
    in = $urandom();
    #2;
  end
  forever begin
    ready = $urandom();
    #10000;
  end
  forever begin
    std::randomize(din) with {din inside {'hf0, 'h0f, 'h5a, 'ha5, 'hff, 'h0, 'haa, 'h55, 'h50, 'h05, 'ha0, 'h0a}; };
    #1;
  end  
join
end

initial begin
  #100000;
  $finish;
end
always #0.5 clk = ~clk;

initial begin
  $fsdbDumpfile("tb.fsdb");
  $fsdbDumpvars;
end

endmodule
