!***********driver parameter
!***********exchange efficient
      real k   ! Wm-2K-1
      parameter(k=10.0)
      real F       !exchange factor:F=k*(temp_o-temp_a)
!***********integration step based on basic time step
      real ts_a,ts_o
!***********temperature defined for caculation
      real temp_a,temp_o        !(K)
      common /temp/ temp_a,temp_o
!***********output file operator
      character output*100,atmo_file*100,ocean_file*100
      character ts_a1*6,ts_o1*6,num_a*4,num_o*4    !defined for writing filename 
      common /name/ atmo_file,ocean_file,ts_a1,ts_o1,num_a,num_o
!***********basic time step: 2 day
      integer ts_b
      parameter(ts_b=2)
!***********namelist reading from driver.in
      integer num,tsd_a,tsd_o
      real temp0_a,temp0_o     !(K)
      namelist /tstep/ output,tsd_a,tsd_o,num,temp0_a,temp0_o

      


