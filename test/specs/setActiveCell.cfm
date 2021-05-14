<cfscript>
describe( "setActiveCell", function(){

	beforeEach( function(){
		variables.workbooks = [ s.newXls(), s.newXlsx() ];
		workbooks.Each( function( wb ){
			s.addColumn( wb, "1,1" );
		});
	});

	it( "Sets the active cell on the current active sheet by default", function(){
		workbooks.Each( function( wb ){
			makePublic( s, "getActiveSheet" );
			s.setActiveCell( wb, 2, 1 );
			expect( s.getActiveSheet( wb ).getActiveCell().toString() ).toBe( "A2" );
		});
	});

});	
</cfscript>