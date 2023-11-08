# params: Message, Assertion
assert() {                         
  E_PARAM_ERR=98
  E_ASSERT_FAILED=99

  if [ -z "$2" ] 
  then                   
    return $E_PARAM_ERR   
  fi

  message=$1
  assertion=$2

  if [ ! $assertion ] 
  then
    echo "❌ $message"
    exit $E_ASSERT_FAILED
  else
    echo "✅ $message"
    return
  fi  
} 

# Examples:
# assert "Passes when true" "1 == 1" 
# assert "Fails when false" "1 == 2" 