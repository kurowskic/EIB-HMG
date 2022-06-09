*-----------------------------------------------------------------------------*
PROCEDURE win_Download_OnInit()
*-----------------------------------------------------------------------------*
  LOCAL nLevel := 0

  CTK_DrawBorder( "win_Download" )

  DO_Events()

  win_Main.txb_Name.Value    := ""
  win_Main.txb_Address.Value := ""
  win_Main.txb_Place.Value   := ""

  DO_Events()

  ClearRecords()

  DO_Events()

  nLevel := download_csv()

  DO_Events()


//  IF IsWIndowDefined( win_Download )
  
//     win_Download_Release( nLevel )

//  ENDIF
// Test

      aFrm := CTK_Release( aFrm )
      thisWindow.Release
  DO CASE
  
    CASE nLevel == 0
 //     aFrm := CTK_Release( aFrm )
 //     win_Download.Release

    CASE nLevel == 1
   //   aFrm := CTK_Release( aFrm )
  //    win_Download.Release	 
//      NoInternetAccess()

    CASE nLevel == 2
     // aFrm := CTK_Release( aFrm )
  //    win_Download.Release	 	

  END CASE

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Download_OnGotFocus()
*-----------------------------------------------------------------------------*

  CenterModalWindow( "win_Download" )

  AutoAdjustControls( "win_Download" )

  CTK_DrawBorder( "win_Download" )

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
FUNCTION win_Download_Release( xnLevel )
*-----------------------------------------------------------------------------*

	
  DO CASE
  
    CASE xnLevel == 0
      aFrm := CTK_Release( aFrm )
      win_Download.Release

    CASE xnLevel == 1
      aFrm := CTK_Release( aFrm )
      win_Download.Release	 
//      NoInternetAccess()

    CASE xnLevel == 2
      aFrm := CTK_Release( aFrm )
      win_Download.Release	 	

  END CASE
	
	
RETURN xnLevel
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
