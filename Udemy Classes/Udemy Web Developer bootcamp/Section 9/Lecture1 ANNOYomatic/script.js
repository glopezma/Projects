var there = false;
while(!there){
  there = (prompt("Are we there yet?").indexOf("yes") === -1)? false:true;
}
alert("YAY, WE MADE IT!!!");
