function [battery_load] = battery_control_rc_fb_h(demand_load, soc, load_level, n, battery_rate)
% Controls battery output to keep SOC within specified range

if load_level == 1
	num = randperm(n, 1);
	ch = num - 1;
else
	ch = 0;
end

p = rand();
x = rand();
if p <= 1 - soc & ch == 0
	battery_load = -1 * battery_rate * x;
else
	if demand_load < battery_rate
		battery_load = demand_load;
	else 
		battery_load = battery_rate;
	end
end
end