
function categoryHandler(value) {
  console.log(value)
  if(value == ""){
    window.location = "/categories/" + "any"
  }else{
    window.location = "/categories/" + value
  }
}