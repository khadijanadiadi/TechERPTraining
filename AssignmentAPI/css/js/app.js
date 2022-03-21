// $( document ).ready(function() {
//   const book2 = [];
//
// ("Addbutton").click(function(e){
//   e.preventDefault();
//
//   // console.log("add button is clicked");
//
//   let bkid = $("#bookid").val();
//   let bkname = $("#bookname").val();
//   let bkunit = $("#bookunit").val();
//
//   // console.log(bkid);
//   // console.log(bkname);
//   // console.log(bkunit);
//
//
//   const book = { bookid:bkid, bookname:bkname, bookunit:bkunit };
//
//   // console.log(book);
//
// // if(localStorage.getItem('data') == null){
// //   localStorage.setItem('date' , []);
// // }
//
// // var old_data = JSON.parse(localStorage.getItem('dataJSON.Stringfy
// //
// // old_data.push(book);
// //
// //
// // localStorage.setItem('data', old_data);
//
//
//
//  // books2.push (JSON.parse(localStorage.getItem('book')));
//
//
//
//  books2.push(localStorage.getItem('book'));
//
//  books2.push(book);
//
//
//  // localStorage.setItem('book',books2);
//
//  console.log(books2);
//
//
// // localStorage.setItem("book",books);
// //
// // var old_data = JSON.parse(localStorage.getItem('book'));
// //
// //
// //
// // const new_data = JSON.stringify(book);
// //
// //
// // old_data =
// //  console.log(old_data);
//
//
// // localStorage.setItem("book",old_data);
// // console.log(localStorage.getItem('book'));
//
//
//   // if(typeof(Storage)!==undefined){
//   //   window.localStorage.setItem("bookid",bkid);
//   // }
//   // else{
//   //   alert("Storage not supporting");
//   // }
// });
// });




$(document).ready(function(){

  const my_array = [];

  $("#Addbutton").click(function(e){
    e.preventDefault();

    console.log("button got clicked");


    let bkid = $("#bookid").val();
    let bkname = $("#bookname").val();
    let bkunit = $("#bookunit").val();


    const book  = {bookid: bkid, bookname:bkname, bookunit:bkunit};


    my_array.push(book);
    const new_array = JSON.stringify(my_array);
    localStorage.setItem("book",new_array);

  })


    // if(my_array.size == null){
    //   my_array.push(book);
    //   localStorage.setItem("book",my_array);
    // }
    // else{
    //   my_array.push(book);
    //   localStorage.setItem("book",my_array);
    // }

    // console.log(book);
    // console.log(my_array);



    $("#Searchbutton").click(function(e){
      e.preventDefault();

      let bkid = $("#bookid").val();

      let new_array = [];

        new_array = JSON.parse(localStorage.getItem("book") || "[]");

        // console.log(new_array.length);


      // for(let i=0;i<new_array.length;i++){

        // let temp_array = new_array[0];

        let neww_array = $.grep(new_array, function(e){
          return (e.bookid == bkid);
        })
        console.log(neww_array);

      // }
    })


/



    $("#Deletebutton").click(function(e){
      e.preventDefault();

      let bkid = $("#bookid").val();

      let new_array = [];
      // let temp_array;

       // console.log(localStorage.getItem('book'));

        new_array = JSON.parse(localStorage.getItem("book") || "[]");

        // console.log(new_array.length);


      // for(let i=0;i<new_array.length;i++){
      //   let temp_array = new_array[0];

        // let neww_array = $.grep(new_array, function(e){
        //   return (e.bookid == bkid);
        // })

        let replace_array = [];

        for(let i=0;i<new_array.length;i++){

          let temp_array = new_array[i];

          let c = JSON.stringify(temp_array.bookid);

          console.log(c);

          if(c !== bkid){
            replace_array.push(temp_array);
          }

          // if(temp_array.bookid == bkid){
          //   // replace_array.push(temp_array);
          //   console.log(c);
          // }
        }



        console.log(replace_array);

        // let temp_array = [];
        // Boolean b = true;



      // }
    })




    $("#updatebutton").click(function(e){
      e.preventDefault();


      let bkid = $("#bookid").val();
      let bkname = $("#bookname").val();
      let bkunit = $("#bookunit").val();


      const updatedbook = {bookid:bkid , bookname:bkname, bookunit:bkunit};



              let replace_array = [];

              for(let i=0;i<new_array.length;i++){

                let temp_array = new_array[i];

                let c = JSON.stringify(temp_array.bookid);

                console.log(c);

                if(c !== bkid){
                  replace_array.push(temp_array);
                }

            }

            replace_array.push(updatedbook);
    })





  // console.log(my_array);
})
