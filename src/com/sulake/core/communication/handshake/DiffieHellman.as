package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1499:BigInteger;
      
      private var var_957:BigInteger;
      
      private var var_1962:BigInteger;
      
      private var var_1498:BigInteger;
      
      private var var_1961:BigInteger;
      
      private var var_1711:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1499 = param1;
         var_1962 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1961.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1498 = new BigInteger();
         var_1498.fromRadix(param1,param2);
         var_1961 = var_1498.modPow(var_957,var_1499);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1711.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_957 = new BigInteger();
         var_957.fromRadix(param1,param2);
         var_1711 = var_1962.modPow(var_957,var_1499);
         return true;
      }
   }
}
