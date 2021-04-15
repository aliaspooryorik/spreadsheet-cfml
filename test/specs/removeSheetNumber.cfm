<cfscript>
describe( "removeSheetNumber", function(){

	beforeEach( function(){
		variables.workbooks = [ s.newXls(), s.newXlsx() ];
	});

	it( "Deletes the sheet number specified", function(){
		workbooks.Each( function( wb ){
			s.createSheet( wb, "test" );
			s.removeSheetNumber( wb, 2 );
			expect( wb.getNumberOfSheets() ).toBe( 1 );
		});
	});


	describe( "removeSheetNumber throws an exception if", function(){

		it( "the sheet number doesn't exist", function(){
			workbooks.Each( function( wb ){
				expect( function(){
					s.removeSheetNumber( wb, 20 );
				}).toThrow( regex="Invalid sheet" );
			});
		});

	});	

});	
</cfscript>