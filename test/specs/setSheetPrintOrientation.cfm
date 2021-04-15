<cfscript>
describe( "setSheetPrintOrientation", function(){

	beforeEach( function(){
		variables.workbooks = [ s.newXls(), s.newXlsx() ];
		makePublic( s, "getActiveSheet" );
		makePublic( s, "getSheetByName" );
		makePublic( s, "getSheetByNumber" );
	});

	it( "by default sets the active sheet to the specified orientation", function(){
		workbooks.Each( function( wb ){
			var sheet = s.getActiveSheet( wb );
			expect( sheet.getPrintSetup().getLandscape() ).toBeFalse();
			s.setSheetPrintOrientation( wb, "landscape" );
			expect( sheet.getPrintSetup().getLandscape() ).toBeTrue();
			s.setSheetPrintOrientation( wb, "portrait" );
			expect( sheet.getPrintSetup().getLandscape() ).toBeFalse();
		});
	});

	it( "sets the named sheet to the specified orientation", function(){
		workbooks.Each( function( wb ){
			s.createSheet( wb, "test" );
			s.setSheetPrintOrientation( wb, "landscape", "test" );
			var sheet = s.getSheetByName( wb, "test" );
			expect( sheet.getPrintSetup().getLandscape() ).toBeTrue();
		});
	});

	it( "sets the specified sheet number to the specified orientation", function(){
		workbooks.Each( function( wb ){
			s.createSheet( wb, "test" );
			var sheet = s.getSheetByNumber( wb, 2 );
			expect( sheet.getPrintSetup().getLandscape() ).toBeFalse();
			// named arguments
			s.setSheetPrintOrientation( workbook=wb, mode="landscape", sheetNumber=2 );
			expect( sheet.getPrintSetup().getLandscape() ).toBeTrue();
			//positional
			s.setSheetPrintOrientation( wb, "portrait", "", 2 );
			expect( sheet.getPrintSetup().getLandscape() ).toBeFalse();
		});
	});

	describe( "setSheetPrintOrientation throws an exception if", function(){

		it( "the mode is invalid", function(){
			workbooks.Each( function( wb ){
				expect( function(){
					s.setSheetPrintOrientation( wb, "blah" );
				}).toThrow( regex="Invalid mode" );
			});
		});

		it( "the both sheet name and number are specified", function(){
			workbooks.Each( function( wb ){
				expect( function(){
					s.setSheetPrintOrientation( wb, "landscape", "test", 1 );
				}).toThrow( regex="Invalid arguments" );
			});
		});

	});

});	
</cfscript>