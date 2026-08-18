clear
%clc %(apaga command window, deixar desativado por enquanto)

L_1 = erro(0.12055,0.00005);
L_2 = erro(0.12060,0.00005);
m_1 = erro(0.19604,0.00001);
m_2 = erro(0.19602,0.00001);
m_2_2 = erro(0.19678,0.00002);
dt_1 = erro(0.066,0.001);
dt_2 = erro(0.064,0.001);
v_1f = erro(1.83,0.03);
v_2i = erro(1.88,0.03);
p_1f = erro(0.359,0.006);
p_2i = erro(0.369,0.006);
dp = erro(0.01,0.01);
k_i = erro(0.35,0.01);
k_f = erro(0.33,0.01);
vcm = erro(0.94,0.02);
v_1ic = erro(-0.94,0.02);
v_1fc = erro(0.89,0.05);
v_2ic = erro(0.94,0.05);
v_2fc = erro(-0.94,0.02);
p_1ic = erro(-0.184,0.004);
p_2ic = erro(0.18,0.01);
p_1fc = erro(0.17,0.01);
p_2fc = erro(-0.184,0.004);
dp1c = erro(0.36,0.01);
dp2c = erro(-0.35,0.01);
pfc = erro(0.00,0.01);
pic = erro(-0.01,0.01);
dpc = erro(0.01,0.02);
k_1i = erro(0.087,0.004);
k_2i = erro(0.09,0.01);
k_1f = erro(0.08,0.01);
k_2f = erro(0.087,0.004);
dtt_2 = erro(0.082,0.001);
dtt_12 = erro(0.172,0.001);
vi = erro(1.47,0.02);
vf = erro(0.701,0.004);
p_i = erro(0.289,0.004);
p_f = erro(0.275,0.002);
v = erro(-0.77,0.02);
kip = erro(0.213,0.006);
kfp = erro(0.097,0.001);

x=(kfp-kip)/kip
