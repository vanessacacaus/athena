package{
	import flash.utils.*
	import flash.system.Capabilities
	import flash.text.*
	
	public class Fix {

		public static function utf(txt_field:*):void{
			
			var cp1252 = new Object();
			
			cp1252[0x20ac]=0x80;
			cp1252[0x201a]=0x82;
			cp1252[0x0192]=0x83;
			cp1252[0x201e]=0x84;
			cp1252[0x2026]=0x85;
			cp1252[0x2020]=0x86;
			cp1252[0x2021]=0x87;
			cp1252[0x02c6]=0x88;
			cp1252[0x2030]=0x89;
			cp1252[0x0160]=0x8a;
			cp1252[0x2039]=0x8b;
			cp1252[0x0152]=0x8c;
			cp1252[0x017d]=0x8e;
			cp1252[0x2018]=0x91;
			cp1252[0x2019]=0x92;
			cp1252[0x201c]=0x93;
			cp1252[0x201d]=0x94;
			cp1252[0x2022]=0x95;
			cp1252[0x2013]=0x96;
			cp1252[0x2014]=0x97;
			cp1252[0x02dc]=0x98;
			cp1252[0x2122]=0x99;
			cp1252[0x0161]=0x9a;
			cp1252[0x203a]=0x9b;
			cp1252[0x0153]=0x9c;
			cp1252[0x017e]=0x9e;
			cp1252[0x0178]=0x9f;

			var os = Capabilities.os.toString();
			if (os.indexOf('Linux')==-1) { return; }
			
				var s = txt_field;
				
				var t = s.text;
				var i = s.caretIndex-1; 
				
				
				var d = i;
							
				while (((t.charCodeAt(i)>=0x80 && t.charCodeAt(i)<=0xBF) || (cp1252[t.charCodeAt(i)] != null)) && i>0) {
					if (cp1252[t.charCodeAt(i)]) {
						t=t.substr(0,i)+String.fromCharCode(cp1252[t.charCodeAt(i)])+t.substr(i+1);
					}
					i--;
				}
				if (i==d) { return; }
			
				var u=0;
				if (t.charCodeAt(i)>=0xC2 && t.charCodeAt(i)<=0xDF && d-i==1) {
					// two-byte sequence
					u= (t.charCodeAt(i+1) & 0x3F)       +
					  ((t.charCodeAt(i  ) & 3   ) << 6) +
					  ((t.charCodeAt(i  ) & 0x1C) << 6);
				} else if (t.charCodeAt(i)>=0xE0 && t.charCodeAt(i)<=0xEF && d-i==2) {
					// three-byte sequence
					// (Flash Player doesn't cope with any more obscure Unicode)
					u= (t.charCodeAt(i+2) & 0x3F)        +
					  ((t.charCodeAt(i+1) & 3   ) << 6 ) +
					  ((t.charCodeAt(i+1) & 0x3C) << 6 ) +
					  ((t.charCodeAt(i  ) & 0x0F) << 12);
				}
			
				if (u!=0) {
					s.text=t.slice(0,i)+String.fromCharCode(u)+t.slice(d+1);
					s.text=s.text.split(String.fromCharCode(0x03)).join('');
				}
		} 
	}
}