package {

	/**
	 * ...
	 * @author Bruno Milare
	 */
	public class Impressao {

		function imprimir(e:MouseEvent):void {
			
			var pj:PrintJob = new PrintJob();

			if (mpj.start()) {
				try {
					my_pj.addPage(print_mc_2);
				} catch (e:Error) {
					print_mc.questionField_txt.text = "T";
				}
				pj.send();
			}
		}
	}
}