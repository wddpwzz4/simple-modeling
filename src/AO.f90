!*************atmosphere module      
      subroutine atmosphere(k,F,ts)
      implicit none
      include 'atmo_par.h'
      real k,ts,F
      real temp_a,temp_o
      common /temp/ temp_a,temp_o
      temp_a=(1-tao_a*ts/C_a)*temp_a+(R_a+F)*ts/C_a
      write(2)temp_a
      return
      end subroutine atmosphere

!*************ocean module
      subroutine ocean(k,F,ts)
      implicit none
      include 'ocean_par.h'
      real k,ts,F
      real temp_a,temp_o
      common /temp/ temp_a,temp_o
      temp_o=(1-tao_o*ts/C_o)*temp_o+(R_o-F)*ts/C_o
      write(3)temp_o
      return
      end subroutine ocean

      subroutine ocean2(k,F,ts)
      implicit none
      include 'ocean_par.h'
      real k,ts,F
      real temp_a,temp_o
      common /temp/ temp_a,temp_o
      temp_o=(1-tao_o*ts/C_o)*temp_o+(R_o-F)*ts/C_o
      write(2)temp_o
      return
      end subroutine ocean2