
!*************integer covert to character
      subroutine makename1(output,tsd_a,tsd_o,ts_b,num)
      integer tsd_a,tsd_o,tsday_a,tsday_o,ts_b,num,n_a,n_o
      character output*100,atmo_file*100,ocean_file*100
      character ts_a1*6,ts_o1*6,num_a*4,num_o*4
      common /name/ atmo_file,ocean_file,ts_a1,ts_o1,num_a,num_o
      
      n_a=(num-2)/tsd_a+2
      n_o=(num-2)/tsd_o+2
      tsday_a=tsd_a*ts_b
      tsday_o=tsd_o*ts_b
      if (tsday_a .ge. 10 .and. tsday_a .lt. 100) then
      write(ts_a1,'(i2)')tsday_a
      else if (tsday_a .ge. 1 .and. tsday_a .lt. 10) then
      write(ts_a1,'(i1)')tsday_a
      else
      endif
      if (tsday_o .ge. 10 .and. tsday_o .lt. 100) then
      write(ts_o1,'(i2)')tsday_o
      else if (tsday_o .ge. 1 .and. tsday_o .lt. 10) then
      write(ts_o1,'(i1)')tsday_o
      else
      endif
      write(num_a,'(i4)')n_a
      write(num_o,'(i4)')n_o
      atmo_file=trim(output)//trim(ts_a1)//'_'//trim(ts_o1)//'/atmo_'//trim(ts_a1)
      ocean_file=trim(output)//trim(ts_a1)//'_'//trim(ts_o1)//'/ocean_'//trim(ts_o1)
      end subroutine makename1


subroutine makename2(output,tsd_a,tsd_o,ts_b,num)
      integer tsd_a,tsd_o,tsday_a,tsday_o,ts_b,num
      character output*100,atmo_file*100,ocean_file*100
      character ts_a1*6,ts_o1*6,num_a*4,num_o*4
      common /name/ atmo_file,ocean_file,ts_a1,ts_o1,num_a,num_o
      
      tsday_a=tsd_a*ts_b
      tsday_o=tsd_o*ts_b
      num=(num-1)*tsd_o/tsd_a
      if (tsday_a .ge. 10 .and. tsday_a .lt. 100) then
      write(ts_a1,'(i2)')tsday_a
      else if (tsday_a .ge. 1 .and. tsday_a .lt. 10) then
      write(ts_a1,'(i1)')tsday_a
      else
      endif
      if (tsday_o .ge. 10 .and. tsday_o .lt. 100) then
      write(ts_o1,'(i2)')tsday_o
      else if (tsday_o .ge. 1 .and. tsday_o .lt. 10) then
      write(ts_o1,'(i1)')tsday_o
      else
      endif
      write(num_a,'(i4)')num
      atmo_file=trim(output)//trim(ts_a1)//'_'//trim(ts_o1)
      end subroutine makename2

!*************write ctl file for given time step
      subroutine write_ctl1
      implicit none
      character atmo_file*100,ocean_file*100
      character ts_a1*6,ts_o1*6,num_a*4,num_o*4
      common /name/ atmo_file,ocean_file,ts_a1,ts_o1,num_a,num_o

      open(unit = 4,file=trim(atmo_file)//'.ctl') 
      write(4,*)'dset '//trim(atmo_file)//'.grd'
      write(4,*)'title AO_model atmo output' 
      write(4,*)'undef -99.0'  
      write(4,*)'xdef 1 levels 116'
      write(4,*)'ydef 1 levels 10'
      write(4,*)'zdef 1 levels 1000'
      write(4,*)'tdef '//trim(num_a)//' linear 01jan2018 '//trim(ts_a1)//'dy' 
      write(4,*)'vars 1'  
      write(4,*)'temp 0 99 atmo Temperature' 
      write(4,*)'endvars'
      close(4)
      open(unit = 6,file=trim(ocean_file)//'.ctl') 
      write(6,*)'dset '//trim(ocean_file)//'.grd'
      write(6,*)'title AO_model ocean output' 
      write(6,*)'undef -99.0'  
      write(6,*)'xdef 1 levels 116'
      write(6,*)'ydef 1 levels 10'
      write(6,*)'zdef 1 levels 1000'
      write(6,*)'tdef '//trim(num_o)//' linear 01jan2018 '//trim(ts_o1)//'dy' 
      write(6,*)'vars 1'  
      write(6,*)'temp 0 99 ocean Temperature' 
      write(6,*)'endvars'
      close(6)
      end subroutine write_ctl1


      subroutine write_ctl2
      implicit none
      character atmo_file*100,ocean_file*100
      character ts_a1*6,ts_o1*6,num_a*4,num_o*4
      common /name/ atmo_file,ocean_file,ts_a1,ts_o1,num_a,num_o

      open(unit = 4,file=trim(atmo_file)//'.ctl') 
      write(4,*)'dset '//trim(atmo_file)//'.grd'
      write(4,*)'title AO_model atmo output' 
      write(4,*)'undef -99.0'  
      write(4,*)'xdef 1 levels 116'
      write(4,*)'ydef 1 levels 10'
      write(4,*)'zdef 1 levels 1000'
      write(4,*)'tdef '//trim(num_a)//' linear 01jan2018 '//trim(ts_a1)//'dy' 
      write(4,*)'vars 2'  
      write(4,*)'tempo 0 99 atmo Temperature'
      write(4,*)'tempa 0 99 ocean Temperature' 
      write(4,*)'endvars'
      close(4)
      end subroutine write_ctl2
