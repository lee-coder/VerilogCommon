clean:
  rm -rf ucli.key csrc novas* simv* verdi*
 
run:
  vcs -full64 -sverilog -R -f tb.f
