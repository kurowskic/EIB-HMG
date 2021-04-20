*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*

#DEFINE HTCAPTION          2
#DEFINE WM_NCLBUTTONDOWN 161

*------------------------------------------------------------------------------*
PROCEDURE MoveActiveWindow( hWnd , cForm )
*------------------------------------------------------------------------------*

  LOCAL nMouseRow      := GetCursorRow()
  LOCAL nMouseCol      := GetCursorCol()
  LOCAL nFormRow       := GetProperty( cForm , 'Row' )
  LOCAL nFormCol       := GetProperty( cForm , 'Col' )
  LOCAL nFormHeight    := GetProperty( cForm , 'Height' )
  LOCAL nFormWidth     := GetProperty( cForm , 'Width' )
  LOCAL nDesktopHeight := GetDesktopRealHeight()
  LOCAL nDesktopWidth  := GetDesktopRealWidth()

  LOCAL nAPPRow := 0
  LOCAL nAPPCol := 0

  DEFAULT hWnd := GetActiveWindow()

//  DECLARE WINDOW win_Main


  IF nMouseRow >= nFormRow .AND. nMouseRow <= ( nFormRow + 50 - 1 )

    IF nFormCol >=  0

      PostMessage( hWnd , WM_NCLBUTTONDOWN , HTCAPTION , 0 )

    ENDIF


  ELSE


  ENDIF


  do_events()

  nAPPRow := GetProperty( cForm , 'Row' )
  nAPPCol := GetProperty( cForm , 'Col' )

  do_events()


  IF nAPPCol < 0

    nAPPCol := SetProperty( cForm , 'Col' , 0 )

  ELSE


    IF nAPPCol + nFormWidth > nDesktopWidth

      nAPPCol := SetProperty( cForm , 'Col' , nDesktopWidth - nFormWidth )

    ENDIF


  ENDIF


  IF nAPPRow < 0

    nAPPRow := SetProperty( cForm , 'Row' , 0 )

  ELSE


    IF nAPPRow + nFormHeight > nDesktopHeight

      nAPPRow := SetProperty( cForm , 'Row' , nDesktopHeight - nFormHeight )

    ENDIF

  ENDIF


  do_events()

  APP_ROW    := nAPPRow // win_Main.Row
  APP_COL    := nAPPCol // win_Main.Col
  APP_HEIGHT := nFormHeight // win_Main.Height
  APP_WIDTH  := nFormWidth // win_Main.Width

  do_events()

  aFrm[ 1 , 2 ] := APP_ROW
  aFrm[ 1 , 3 ] := APP_COL

  do_events()


RETURN


#IFDEF _HMG_2_
//*****************************************************************************************
//* borrowed from [MiniGUI]\samples\advanced\FitToDesktop\FitToDesktop.prg
//*****************************************************************************************
 
#pragma BEGINDUMP

#include <mgdefs.h>

HB_FUNC (GETDESKTOPREALTOP) 
{
  RECT rect;
  SystemParametersInfo( SPI_GETWORKAREA, 1, &rect, 0 );

  hb_retni(rect.top);

}
HB_FUNC (GETDESKTOPREALLEFT) 
{
  RECT rect;
  SystemParametersInfo( SPI_GETWORKAREA, 1, &rect, 0 );

  hb_retni(rect.left);

}

HB_FUNC (GETDESKTOPREALWIDTH) 
{
  RECT rect;
  SystemParametersInfo( SPI_GETWORKAREA, 1, &rect, 0 );

  hb_retni(rect.right - rect.left);

}

HB_FUNC (GETDESKTOPREALHEIGHT) 
{
  RECT rect;
  SystemParametersInfo( SPI_GETWORKAREA, 1, &rect, 0 );

  hb_retni(rect.bottom - rect.top);
}

#pragma ENDDUMP
#ENDIF

