function [battery_load] = battery_control_rc_fb_h(demand_load, soc, load_level, n, battery_rate)
% Controls battery output to keep SOC within specified range

if n <= 0
	ch = 0;
elseif load_level == 1
	num = randperm(n, 1);
	ch = num - 1;
else
	if n > 1
		num = randperm(n, 1);
		ch = num - 1;		 
	else 
		ch = 0;
	end
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