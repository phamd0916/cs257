/*
    mockup2.js
    Doug Pham and Tom Pree
    November 11, 2022

    Add team button

*/

function compareTeam(){
    //Adds other team to screen
}

function backToHome() {
    //Returns to home screen
}

function initialize() {
    var button = document.getElementById('addTeam');
    button.onclick = compareTeam
    var button2 = document.getElementById('backHome');
    button.onclick = backToHome
}
window.onload = initialize;