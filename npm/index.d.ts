declare module '@apiverve/incometax' {
  export interface incometaxOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface incometaxResponse {
    status: string;
    error: string | null;
    data: IncomeTaxBracketsData;
    code?: number;
  }


  interface IncomeTaxBracketsData {
      year:              number;
      country:           string;
      type:              string;
      brackets:          Brackets;
      standardDeduction: StandardDeduction;
      lastUpdated:       Date;
  }
  
  interface Brackets {
      single:                  HeadOfHousehold[];
      marriedFilingJointly:    HeadOfHousehold[];
      marriedFilingSeparately: HeadOfHousehold[];
      headOfHousehold:         HeadOfHousehold[];
  }
  
  interface HeadOfHousehold {
      rate: number;
      min:  number;
      max:  number;
  }
  
  interface StandardDeduction {
      single:                  number;
      marriedFilingJointly:    number;
      marriedFilingSeparately: number;
      headOfHousehold:         number;
  }

  export default class incometaxWrapper {
    constructor(options: incometaxOptions);

    execute(callback: (error: any, data: incometaxResponse | null) => void): Promise<incometaxResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: incometaxResponse | null) => void): Promise<incometaxResponse>;
    execute(query?: Record<string, any>): Promise<incometaxResponse>;
  }
}
