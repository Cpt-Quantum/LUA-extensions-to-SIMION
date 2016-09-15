simion.workbench_program()

adjustable total_ions=6	--Number of ions used in simulation
adjustable detector_instance=2	--Detector number in the field precedence order

--Local variables for utility, user has no access to these.
local number_hit_detector=0
local ion_miss=0
local y_min=0
local y_max=0
local y_spread=0

function segment.other_actions()
	--Count number of ions that hit the detector and those which never reach it.
	if ion_splat ~= 0 and ion_instance == detector_instance then
		number_hit_detector=number_hit_detector+1
		if ion_py_mm>y_max then
			y_max= ion_py_mm
		elseif ion_py_mm<y_min then
			y_min= ion_py_mm
		end

	elseif ion_splat~=0 then
		ion_miss = ion_miss + 1	
	end
	
	--Calculate the percentage of total ions transmitted and print to screen.
	if ion_number == total_ions and ion_splat ~= 0 then
		y_spread=y_max-y_min
		print("Spatial spread =",y_spread,"mm")
		print("y_min = ", y_min)
		print("y_max = ", y_max)
	end
end