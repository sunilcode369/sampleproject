pragma solidity ^0.4.13;

contract MovieSale {

    // Used to store user addresses ---> number of movie token hold by the address    
    mapping (string=>details) movieName_OwnerMapping;
    
    struct details {
        address owner;
        string movie_name;
        uint cost;
        bool isAvailableForSale;
    } 
    
    details[10] public movieDetail;
    uint i;

    string movieName;
    string tokenSymbol;
    string tokenName;
    
    address contract_owner;
    

    
    function MovieSale() {
        
        contract_owner = msg.sender;
    }

    function movieRegistration(string _moviename,uint _cost,address _owner, bool status)  
                                                                 {
        // ?? Minimum registration fee - 100 Ethers        
        // ?? Check if the movie name exists
        movieDetail[i].owner = _owner;
        movieDetail[i].movie_name = _moviename;
        movieDetail[i].cost =_cost;
        movieDetail[i].isAvailableForSale = status;
        movieName_OwnerMapping[_moviename] = movieDetail[i];
        i++;
    }
    
    modifier onlyAdmin() {
        if (contract_owner!=msg.sender)
         revert();
        _;
    }
    
    
    event newMovieOwnerBalance(uint);

    function movieSale(address _to, string _movieName) payable {
       // Retrieve movie details by name
       details temp =  movieName_OwnerMapping[_movieName] ;
       assert(msg.value < temp.cost);
       
       // Set the movie sale flag to false
       temp.isAvailableForSale =false;
       // Change the owner
       temp.owner=msg.sender;
       
       newMovieOwnerBalance(_to.balance);
       _to.transfer(temp.cost);
       newMovieOwnerBalance(_to.balance);
    }
    

    function getCounter() constant returns (uint){
        return i;
    }

    function getMovieList(uint x) constant returns  (address,string,uint,bool){
        
        return (movieDetail[x].owner,
                movieDetail[x].movie_name,
                movieDetail[x].cost,
                movieDetail[x].isAvailableForSale);
        // TODO
    }
    
    function updateMovieCost() {
        // TODO
    }

}
