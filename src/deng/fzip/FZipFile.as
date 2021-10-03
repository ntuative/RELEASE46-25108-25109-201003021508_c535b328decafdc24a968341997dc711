package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_497:int = 8;
      
      public static const const_1434:int = 10;
      
      public static const const_1255:int = 6;
      
      private static var var_1036:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1165:int = 0;
      
      public static const const_1513:int = 1;
      
      public static const const_1519:int = 2;
      
      public static const const_1588:int = 3;
      
      public static const const_1591:int = 4;
      
      public static const const_1440:int = 5;
      
      public static const const_1548:int = 9;
      
      public static const const_1602:int = 7;
       
      
      private var var_178:uint = 0;
      
      private var var_1037:uint = 0;
      
      private var var_715:Date;
      
      private var var_2084:int = -1;
      
      private var parseFunc:Function;
      
      private var var_489:Boolean = false;
      
      private var var_2305:int = -1;
      
      private var var_1273:uint = 0;
      
      private var var_2082:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_867:uint;
      
      private var var_20:ByteArray;
      
      private var var_714:uint;
      
      private var var_1530:Boolean = false;
      
      private var var_2306:int = -1;
      
      private var var_1532:String = "2.0";
      
      private var var_177:Boolean = false;
      
      private var var_2083:Boolean = false;
      
      private var var_345:String;
      
      private var var_590:uint = 0;
      
      private var var_1272:int = 0;
      
      private var var_411:String = "";
      
      private var var_713:int = 8;
      
      private var var_1531:Boolean = false;
      
      public function FZipFile(param1:String = "utf-8")
      {
         parseFunc = parseFileHead;
         super();
         var_345 = param1;
         _extraFields = new Dictionary();
         var_20 = new ByteArray();
         var_20.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_590;
      }
      
      public function set filename(param1:String) : void
      {
         var_411 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_177 && false)
         {
            var_20.position = 0;
            if(var_1036)
            {
               var_20.uncompress.apply(var_20,["deflate"]);
            }
            else
            {
               var_20.uncompress();
            }
            var_20.position = 0;
            var_177 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_411;
      }
      
      public function get date() : Date
      {
         return var_715;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && parseFunc(param1))
         {
         }
         return parseFunc === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1531)
         {
            parseFunc = parseFileIdle;
            throw new Error("Data descriptors are not supported.");
         }
         if(var_178 == 0)
         {
            parseFunc = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_178)
            {
               return false;
            }
            parseContent(param1);
            parseFunc = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1532;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_177)
         {
            uncompress();
         }
         var_20.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_20.readUTFBytes(var_20.bytesAvailable);
         }
         else
         {
            _loc3_ = var_20.readMultiByte(var_20.bytesAvailable,param2);
         }
         var_20.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_713 === const_497 && !var_1530)
         {
            if(var_1036)
            {
               param1.readBytes(var_20,0,var_178);
            }
            else
            {
               if(!var_489)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               var_20.writeByte(120);
               _loc2_ = uint(~var_2084 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_20.writeByte(_loc2_);
               param1.readBytes(var_20,2,var_178);
               var_20.position = var_20.length;
               var_20.writeUnsignedInt(var_867);
            }
            var_177 = true;
         }
         else
         {
            if(var_713 != const_1165)
            {
               throw new Error("Compression method " + var_713 + " is not supported.");
            }
            param1.readBytes(var_20,0,var_178);
            var_177 = false;
         }
         var_20.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_1037 + var_1273 > 0)
            {
               parseFunc = parseFileHeadExt;
            }
            else
            {
               parseFunc = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_20.length = 0;
         var_20.position = 0;
         var_177 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_20.writeUTFBytes(param1);
            }
            else
            {
               var_20.writeMultiByte(param1,param2);
            }
            var_714 = ChecksumUtil.CRC32(var_20);
            var_489 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_715 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1272 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1272 << 8 | 20);
         param1.writeShort(var_345 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_497);
         var _loc5_:Date = var_715 != null ? var_715 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_714);
         param1.writeUnsignedInt(var_178);
         param1.writeUnsignedInt(var_590);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_345 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_411);
         }
         else
         {
            _loc8_.writeMultiByte(var_411,var_345);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_489)
            {
               _loc16_ = var_177;
               if(_loc16_)
               {
                  uncompress();
               }
               var_867 = ChecksumUtil.Adler32(var_20,0,var_20.length);
               var_489 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_867);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_345 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_2082);
            }
            else
            {
               _loc8_.writeMultiByte(var_2082,var_345);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_178 > 0)
         {
            if(var_1036)
            {
               _loc13_ = 0;
               param1.writeBytes(var_20,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_20,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_178;
      }
      
      protected function compress() : void
      {
         if(!var_177)
         {
            if(false)
            {
               var_20.position = 0;
               var_590 = var_20.length;
               if(var_1036)
               {
                  var_20.compress.apply(var_20,["deflate"]);
                  var_178 = var_20.length;
               }
               else
               {
                  var_20.compress();
                  var_178 = -6;
               }
               var_20.position = 0;
               var_177 = true;
            }
            else
            {
               var_178 = 0;
               var_590 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_1037 + var_1273)
         {
            parseHeadExt(param1);
            parseFunc = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_345 == "utf-8")
         {
            var_411 = param1.readUTFBytes(var_1037);
         }
         else
         {
            var_411 = param1.readMultiByte(var_1037,var_345);
         }
         var _loc2_:uint = var_1273;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               throw new Error("Parse error in file " + var_411 + ": Extra field data size too big.");
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_867 = param1.readUnsignedInt();
               var_489 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1272 = _loc2_ >> 8;
         var_1532 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_713 = param1.readUnsignedShort();
         var_1530 = (_loc3_ & 1) !== 0;
         var_1531 = (_loc3_ & 8) !== 0;
         var_2083 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_345 = "utf-8";
         }
         if(var_713 === const_1255)
         {
            var_2306 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2305 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_713 === const_497)
         {
            var_2084 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_715 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_714 = param1.readUnsignedInt();
         var_178 = param1.readUnsignedInt();
         var_590 = param1.readUnsignedInt();
         var_1037 = param1.readUnsignedShort();
         var_1273 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_20,0,param1.length);
            var_714 = ChecksumUtil.CRC32(var_20);
            var_489 = false;
         }
         else
         {
            var_20.length = 0;
            var_20.position = 0;
            var_177 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_411 + "\n  date:" + var_715 + "\n  sizeCompressed:" + var_178 + "\n  sizeUncompressed:" + var_590 + "\n  versionHost:" + var_1272 + "\n  versionNumber:" + var_1532 + "\n  compressionMethod:" + var_713 + "\n  encrypted:" + var_1530 + "\n  hasDataDescriptor:" + var_1531 + "\n  hasCompressedPatchedData:" + var_2083 + "\n  filenameEncoding:" + var_345 + "\n  crc32:" + var_714.toString(16) + "\n  adler32:" + var_867.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_177)
         {
            uncompress();
         }
         return var_20;
      }
   }
}
