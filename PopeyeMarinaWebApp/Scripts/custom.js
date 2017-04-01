
// DatePicker

function pageLoad() {
    $('.DatePicker').datepicker(
    {
        dateFormat: 'dd/mm/yy',
        changeMonth: true,
        changeYear: true,
        yearRange: '1950:2100'
    });
}

// Delete Button Alert

function DeleteButton(){
    confirm('This record will be deleted permanently from the database. Do you wish to proceed?');
}











