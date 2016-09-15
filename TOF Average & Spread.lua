--Lua file for finding average TOF and TOF spread.
simion.workbench_program()

adjustable detector_instance = 1	-- Instance of Detector
adjustable total_ions=1000		-- Number of ions used in simulation

local ion_tof_sum=0
local ion_tof_avg=0

local number_hit_detector=0
local number_miss_detector=0

local ion_tof_min=5E8
local ion_tof_max=0
local ion_tof_spread=0

	
function segment.other_actions() 

	if ion_splat ~= 0 and ion_instance == detector_instance then

		ion_tof_sum=ion_tof_sum+ion_time_of_flight
		number_hit_detector=number_hit_detector+1
	
		if ion_tof_min>ion_time_of_flight then

			ion_tof_min=ion_time_of_flight
		end

		if ion_tof_max<ion_time_of_flight then

			ion_tof_max=ion_time_of_flight

		end

	elseif ion_splat~=0 then

		number_miss_detector = number_miss_detector + 1	

	end

	if ion_splat ~= 0 and ion_number == total_ions then

		ion_tof_avg=ion_tof_sum/number_hit_detector
		print("Ion TOF average =",ion_tof_avg)
		ion_tof_spread=ion_tof_max-ion_tof_min
		print("Ion TOF spread =",ion_tof_spread)
		print("Ion TOF minimum =",ion_tof_min,"Ion TOF maximum =",ion_tof_max)
	end

end