function registerMovie() {
 
 // Gets all the individual elments from the Form
  var _movie_name        = document.getElementById("movie_name").value;
  var _cost        = document.getElementById("cost").value;
  var _address        = document.getElementById("addr").value;
  var _isAvailableForSale     = document.getElementById("isAvailableForSale").value;

  MovieSale.deployed().then(function(instance){

      return instance.movieRegistration(_movie_name,_cost,_address,_isAvailableForSale,{from:web3.eth.coinbase,gas:1164443});

  });

  alert("Movie registration successfull");

}


function loadMovies() {
var table_header ='<table style="width:100%" border=4><tr><th>Owner Address</th><th>Movie Name</th><th>Cost</th><th>Sale status</th></tr>';
var tablecont = table_header ;
var endtable ="</table>";

		MovieSale.deployed().then(function(output) {
		  return output.getMovieList.call(0).then(function(result) {
			tablecont = tablecont + "<td>"+result[0]+"</td>";
			tablecont = tablecont + "<td>"+result[1]+"</td>";
			tablecont = tablecont + "<td>"+result[2]+"</td>";
			tablecont = tablecont + "<td>"+result[3]+"</td>" + "</tr>"+ endtable;
   			var divtable = document.getElementById("mytable");
	                divtable.innerHTML = tablecont;
		});
	});
};



