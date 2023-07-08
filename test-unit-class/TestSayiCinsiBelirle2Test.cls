@IsTest
public class TestSayiCinsiBelirle2Test {    
    // Pozitif, Negatif ve Sıfır için beklenen ve beklenmeyen methods yazılır.     
    @IsTest
    static void sayiCinsiTest1() {
        
        // Pozitif sayı ile TEST -> Verilen sayı 10 Beklenen sonuc == 'ELMA'
        String sonuc = TestSayiCinsiBelirle2.sayiCinsi(10);         
        
        // Pozitif test 
        System.assertEquals('ELMA', sonuc); // Beklenen
        // ELMA yada ARMUT yerine başka bişey yazılırsa HATA MESAJI alınır. 
        // Test geçilmez. Hata LOG içerisinde görülür.   
        
        // Negatif test (BURASI YAZILMASA DA OLUR)
        System.assertNotEquals('ARMUT', sonuc); // Beklenmeyen    
        System.assertNotEquals('UZUM', sonuc);                 
    }
    
    @IsTest
    static void sayiCinsiTest2() {
		// Farklı Method ile yapılabilir. 
        // Negatif sayı ile TEST -> Verilen sayı -10 Beklenen sonuc == 'ARMUT'
        String sonuc2 = TestSayiCinsiBelirle2.sayiCinsi(-10); 
        
        // Pozitif test 
        System.assertEquals('ARMUT', sonuc2); 
        
         // Negatif test 
        System.assertNotEquals('ELMA', sonuc2); 
        System.assertNotEquals('UZUM', sonuc2); 
        // ELMA yada ARMUT yerine başka bişey yazılırsa HATA MESAJI alınır. 
        // Test geçilmez. Hata LOG içerisinde görülür.  
    }
    
    @IsTest
    static void sayiCinsiSIFIRTest() {
        
        // Sıfır sayı ile TEST -> Verilen sayı 0 Beklenen sonuc == 'UZUM'
        String sonuc = TestSayiCinsiBelirle2.sayiCinsi(0);   
        
        // Pozitif test BEKLENEN
        System.assertEquals('UZUM', sonuc); 
        
        // Negatif test BEKLENMEYEN
        System.assertNotEquals('ELMA', sonuc); 
        System.assertNotEquals('ARMUT', sonuc); 
        
        // Negatif kısmı yazılmasa da olur. Sonuç %100 çıkar. 
        // assertEquals() BEKLENEN
        // assertNotEquals() BEKLENMEYEN
    }
}