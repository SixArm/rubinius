require 'benchmark'

total = (ENV['TOTAL'] || 80_000).to_i

S = ["(n\026A\204eu[k\354t]Av8<bQS{|d\212_,g:5/g!aa6?\201\375\225qfBuA:\356;Aw>\017*"]
M = ["Kw8Y=%2=0hXBAA/1<Q=\350\206|\212/mz\f\370jvZ*51\221Wme}Sf/\002\322x>h\004\\#6\212-dX*WO^CN!6?mom/m3T]w-3l\217\232O\271c<-{\301oAb@*p[/\\j4V>STA"]
L = ["48+q\"x/X)Vk\321]eyrZG'\350k'zPKAEu$pO\2032'}\201V\225l%<|\002)yGBR8\017*Ct<g'\2223,YMTRzhqD<=+\271M\3403l|1ybwv5\222[\301_{B@Kp(\\\27706r}S\244kMsvf?;uvM?}}\025kst`Yu4,\\=E)A=tLt);\351:s\">Wu=3p7vKZD+v\242\320Ia\\\277v\360O\2177D\\ip8Bnuc=+Zd4E?Z`tVfTPk>\247W#QY<@]t*.H;.<6OsG\017\3673B^h\275F\354w53\3033^[Y\345\354D.+veLB}\254?qM,\"\\D!Xc,Sbtpp%j&C\"Kw"]

Benchmark.bmbm do |x|
  x.report("loop") do
    total.times { 1 }
  end

  x.report("[S].pack('M')") do
    total.times { S.pack('M') }
  end

  x.report("[M].pack('M')") do
    total.times { M.pack('M') }
  end

  x.report("[L].pack('M')") do
    total.times { L.pack('M') }
  end

  x.report("[S].pack('M40')") do
    total.times { S.pack('M40') }
  end

  x.report("[M].pack('M40')") do
    total.times { M.pack('M40') }
  end

  x.report("[L].pack('M40')") do
    total.times { L.pack('M40') }
  end
end
