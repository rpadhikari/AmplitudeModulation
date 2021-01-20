set term postscript enhanced color 'Helvetica-Bold,16'
Fa=2000.0 # Audio frequency in Hz
Fc=792000.0 # Carrier wave frequency in Hz
Wa = 2.0*pi*Fa; Wc = 2.0*pi*Fc
set samples 100000 # Number of time steps
set xr [0:0.002] # time range
Va = 3.0 # Vpp of Audio wave
Vc = 2.0 # Vpp of career wave
m = Va/Vc
# setting line styles
set title 'Mediumwave, Bhainsepati Lalitpur'
set xl 'Time (sec)'
set yl 'Voltage (V)'
set style line 1 lt 1 lw 0.1 lc rgb 'red'
set style line 2 lt 1 lw 0.1 lc rgb 'blue'
set style line 3 lt 1 lw 2 lc rgb 'black' 
fa1(x) = Va * sin(Wa*x) # Equation of Audio wave
fc1(x) = Vc * sin(Wc*x) # Equation of Radio wave
fx(x) = Vc*sin(Wc*x)+0.5*m*Vc*(cos((Wc-Wa)*x) - cos((Wc+Wa)*x)) # Modulated wave
set output 'am.ps'
plot fx(x) ti 'modulated' ls 2
set output
! ps2pdf am.ps
! rm am.ps

