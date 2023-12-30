
import { CommandInterface } from "./command.interface";
import { Transaction } from 'bitcoinjs-lib/src/transaction';
 
export class DecodeTxCommand implements CommandInterface {
  constructor(
    private rawtx: string
  ) {
     
  }
  async run(): Promise<any> {
    const tx = Transaction.fromHex(this.rawtx);
    return {
      success: true,
      data: {
        tx: tx,
      }
    };
  }
}