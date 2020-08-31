function saveOnclick(){

}

window.onload=function(){
    var firebaseRef = firebase.database().ref("User");
    firebaseRef.once('value').then(function(dataSnapshot){
        console.log(dataSnapshot.val());
    });
}