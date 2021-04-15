<cfscript>
describe( "clearCell", function(){

	beforeEach( function(){
		variables.workbooks = [ s.newXls(), s.newXlsx() ];
	});

	it( "Clears the specified cell", function(){
		var expected = "";
		workbooks.Each( function( wb ){
			s.setCellValue( wb, "test", 1, 1 );
			s.clearCell( wb, 1, 1 );
			var actual = s.getCellValue( wb, 1, 1 );
			expect( actual ).toBe( expected );
			expect( s.getCellType( wb, 1, 1 ) ).toBe( "BLANK" );
		});
	});

	it( "Clears the specified range of cells", function(){
		var data = QueryNew( "column1,column2,column3", "VarChar,VarChar,VarChar", [ [ "a","b","c" ], [ "d","e","f" ], [ "g","h","i" ] ] );
		var expected = QueryNew( "column1,column2,column3", "VarChar,VarChar,VarChar", [ [ "a","b","c" ], [ "d","","" ], [ "g","","" ] ] );
		workbooks.Each( function( wb ){
			s.addRows( wb, data );
			s.clearCellRange( wb, 2, 2, 3, 3 );
			var actual = s.sheetToQuery( workbook=wb, includeBlankRows=true );
			expect( actual ).toBe( expected );
		});
	});

});	
</cfscript>