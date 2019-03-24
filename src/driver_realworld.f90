      program AO_driver
      implicit none
      integer i,j    !caculating step
      include 'spin_par2.h'
      open(unit =1,file='driver.in',status='old')    !read namelist
      read(1,tstep)
      close(1)
      call makename2(output,tsd_a,tsd_o,ts_b,num)     !create name automaticlly
      call write_ctl2      !write ctl file
      open(unit=2,file=trim(atmo_file)//'.grd',status='replace',form='binary')
!main loop for caculation
      ts_a=tsd_a*ts_b/365.25       ! convert day to year
      ts_o=tsd_o*ts_b/365.25
      temp_a=temp0_a            ! initial temperature
      temp_o=temp0_o
      write(2)temp_a            
      write(2)temp_o
!caculation 
      do i=1,num-1            
        if (i .gt. 1) then
          call ocean2(k,F_ao,ts_o)
        endif
        F_ao=0
        do j=1,tsd_o/tsd_a
            call atmosphere(k,F_oa,ts_a) 
            F_oa=k*(temp_o-temp_a)
            F_ao=F_ao+F_oa
            if (j .lt. tsd_o/tsd_a) then
              write(2)temp_o
            endif
        enddo 
        F_ao=F_ao/tsd_o*tsd_a
      enddo
      close(2)
      !read final state into restart.out 
      open(unit =7,file='restart.out',status='replace',form='formatted')
      write(7,*)temp_a
      write(7,*)temp_o

      end program AO_driver

    

      

      






