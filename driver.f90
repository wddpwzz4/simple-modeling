      program AO_driver
      implicit none
      integer i    !caculating step
      include 'spin_par.h'
      open(unit =1,file='driver.in',status='old')    !read namelist
      read(1,tstep)
      close(1)
      call makename1(output,tsd_a,tsd_o,ts_b,num)     !create name automaticlly
      call write_ctl1      !write ctl file
      open(unit=2,file=trim(atmo_file)//'.grd',status='replace',form='binary')
      open(unit=3,file=trim(ocean_file)//'.grd',status='replace',form='binary')
      !main loop for caculation
      ts_a=tsd_a*ts_b/365.25       ! convert day to year
      ts_o=tsd_o*ts_b/365.25
      temp_a=temp0_a            ! initial temperature
      temp_o=temp0_o
      write(2)temp_a            
      write(3)temp_o
      do i=1,num-1            !caculation  
        F=k*(temp_o-temp_a)
        if (mod(i-1,tsd_a) .eq. 0) then
          call atmosphere(k,F,ts_a)
        endif  
        if (mod(i-1,tsd_o) .eq. 0) then  
          call ocean(k,F,ts_o)
        endif
      enddo
      close(2)
      close(3)
      !read final state into restart.out 
      open(unit =7,file='restart.out',status='replace',form='formatted')
      write(7,*)temp_a
      write(7,*)temp_o

      end program AO_driver

    

      

      






