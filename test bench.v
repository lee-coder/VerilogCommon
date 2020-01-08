module testbench;

paramter cnt_width = 4;
reg clk, en, clr;

bit[cnt_width-1: 0] count;

up_counter #(cnt_width) upc_inst(.en(en), .clr(clr), .count(count), .clk(clk));

initial begin
  clk = 0;
  en = 0;
  clr = 0;
  repeat(10) begin
    en = $urandom();
    clr = $urandom();
    #200;
  end
  $finish;
end
always #1 clk = ~clk;

initial begin
  $fsdbDumpfile("tb.fsdb");
  $fsdbDumpvars;
end

endmodule
