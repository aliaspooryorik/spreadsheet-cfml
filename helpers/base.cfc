component accessors="true"{

	property name="libraryInstance";
	property name="rootPath";

	any function init( required Spreadsheet libraryInstance ){
		this.setLibraryInstance( arguments.libraryInstance );
		this.setRootPath( GetDirectoryFromPath( GetCurrentTemplatePath() ) & "../" );
		return this;
	}

	Spreadsheet function library(){
		return this.getLibraryInstance();
	}

	any function getCellHelper(){
		return library().getCellHelper();
	}

	any function getClassHelper(){
		return library().getClassHelper();
	}

	any function getColorHelper(){
		return library().getColorHelper();
	}

	any function getColumnHelper(){
		return library().getColumnHelper();
	}

	any function getCommetHelper(){
		return library().getCommetHelper();
	}

	any function getCsvHelper(){
		return library().getCsvHelper();
	}

	any function getDataTypeHelper(){
		return library().getDataTypeHelper();
	}

	any function getDateHelper(){
		return library().getDateHelper();
	}

	any function getExceptionHelper(){
		return library().getExceptionHelper();
	}

	any function getFileHelper(){
		return library().getFileHelper();
	}

	any function getFontHelper(){
		return library().getFontHelper();
	}

	any function getFormatHelper(){
		return library().getFormatHelper();
	}

	any function getHeaderImageHelper(){
		return library().getHeaderImageHelper();
	}

	any function getImageHelper(){
		return library().getImageHelper();
	}

	any function getInfoHelper(){
		return library().getInfoHelper();
	}

	any function getQueryHelper(){
		return library().getQueryHelper();
	}

	any function getRangeHelper(){
		return library().getRangeHelper();
	}

	any function getRowHelper(){
		return library().getRowHelper();
	}

	any function getSheetHelper(){
		return library().getSheetHelper();
	}

	any function getStringHelper(){
		return library().getStringHelper();
	}

	any function getWorkbookHelper(){
		return library().getWorkbookHelper();
	}

}