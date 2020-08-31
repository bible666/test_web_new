<?php namespace App\Controllers;

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Spreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Home extends BaseController
{
    public function index()
    {
        //     $inputFileName = './AAA.xlsx';
        //     $inputFileType = 'Xlsx';
        //     /**  Create a new Reader of the type defined in $inputFileType  **/
        //     //$spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load("AAA.xlsx");
        //     $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputFileType);
        //     $reader->setIncludeCharts(true);
        //     $spreadsheet = $reader->load($inputFileName);

        //     $sheet = $spreadsheet->getActiveSheet();
        //     //print_r($sheet->getChartNames());
        //     //print_r($sheet->getChartByIndex(0)->getPlotArea()->getPlotSeriesCount());
        //     //echo "//";
        //    // print_r($sheet->getChartByIndex(0)->getPlotArea()->plotSeries);
        //     /**  Load $inputFileName to a Spreadsheet Object  **/
        //     //$spreadsheet = $reader->load($inputFileName);
        //     // $spreadsheet = new Spreadsheet();
        //     // $sheet = $spreadsheet->getActiveSheet();
        //     // $sheet->setCellValue('A1', 'Hello World !');

        //     $writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet, 'Xlsx');
        //     $writer->setIncludeCharts(true); // useless since no charts were loaded
        //     $writer->save('template2.xlsx'); // cell A1 has value 123, but the chart is gone

        //$filename = 'name-of-the-generated-file.xlsx';
        if ( !copy( './AAA.xlsx', 'bbb.xlsx' ) ) {
            echo 'error';
            exit;
        }

        $inputFileName = './bbb.xlsx';
        $inputFileType = 'Xlsx';
        /**  Create a new Reader of the type defined in $inputFileType  **/
        //$spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load("AAA.xlsx");
        $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader( $inputFileType );
        $reader->setIncludeCharts( true );
        $spreadsheet = $reader->load( 'bbb.xlsx' );

        $sheet = $spreadsheet->getActiveSheet();
        //print_r($sheet->getChartNames());
        //print_r($sheet->getChartByIndex(0)->getPlotArea()->getPlotSeriesCount());
        //echo "//";
        // print_r($sheet->getChartByIndex(0)->getPlotArea()->plotSeries);
        /**  Load $inputFileName to a Spreadsheet Object  **/
        //$spreadsheet = $reader->load($inputFileName);
        //$spreadsheet = new Spreadsheet();
        //$sheet = $spreadsheet->getActiveSheet();
        $sheet->setCellValue( 'A1', 'Hello World5555 !' );

        $writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter( $spreadsheet, 'Xlsx' );
        $writer->setIncludeCharts( true ); // useless since no charts were loaded
        $writer->save( 'ccc.xlsx' ); // cell A1 has value 123, but the chart is gone

        //$writer->save($filename); // will c

        return view( 'welcome_message' );
    }

    public function download()
    {
        $spreadsheet = new Spreadsheet();
        $sheet       = $spreadsheet->getActiveSheet();
        $sheet->setCellValue( 'A1', 'Hello World !' );

        $writer = new Xlsx( $spreadsheet );

        $filename = 'name-of-the-generated-file';

        header( 'Content-Type: application/vnd.ms-excel' );
        header( 'Content-Disposition: attachment;filename="' . $filename . '.xlsx"' );
        header( 'Cache-Control: max-age=0' );

        $writer->save( 'php://output' ); // download file

    }

    //--------------------------------------------------------------------

}
