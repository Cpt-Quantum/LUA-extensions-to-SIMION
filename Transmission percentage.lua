simion.workbench_program()

adjustable total_ions=1000	--Number of ions used in simulation
adjustable detector_instance=1	--Detector number in the field precedence order

--Local variables for utility, user has no access to these.
local number_hit_detector=0
local transmission=0
local transmission2=0

function segment.other_actions()
	--Count number of ions that hit the detector and those which never reach it.
	if ion_splat ~= 0 and ion_instance == detector_instance then
	number_hit_detector=number_hit_detector+1
	end
	
	--Calculate the percentage of total ions transmitted and print to screen.
	if ion_number == total_ions then
	transmission = 100 * number_hit_detector / (total_ions)
	print("ion transmission =",transmission,"%")
	end
end
