set term postscript enhanced color 'Helvetica-Bold,16'
Fa=2000.0 # Audio frequency in Hz
Fc=20000 # 792000.0 # Carrier wave frequency in Hz
Wa = 2.0*pi*Fa
Wc = 2.0*pi*Fc
set samples 100000 # Number of time steps
set xr [0:0.002] # time range
Va = 3.0 # Vpp of Audio wave
Vc = 3.0 # Vpp of career wave
m = Va/Vc

# setting line styles
set style line 1 lt 1 lw 0.1 lc rgb 'red'
set style line 2 lt 1 lw 0.1 lc rgb 'blue'
set style line 3 lt 1 lw 2 lc rgb 'black' 

fa1(x) = Va * sin(Wa*x) # Equation of Audio wave
fc1(x) = Vc * sin(Wc*x) # Equation of Radio wave
fx(x) = Vc*sin(Wc*x)+0.5*m*Vc*(cos((Wc-Wa)*x) - cos((Wc+Wa)*x)) # Modulated wave
set output 'am.ps'
plot fc1(x) ti 'carrier' ls 1,\
     fx(x) ti 'modulated' ls 2,\
     fa1(x) ti 'audio' ls 3
set output
! ps2pdf am.ps
! rm am.ps

