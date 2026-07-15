declare module '@apiverve/incometax' {
  export interface incometaxOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface incometaxResponse {
    status: string;
    error: string | null;
    data: IncomeTaxBracketsData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface IncomeTaxBracketsData {
      year:              number | null;
      country:           null | string;
      type:              null | string;
      brackets:          Brackets;
      standardDeduction: StandardDeduction;
      lastUpdated:       Date | null;
  }
  
  interface Brackets {
      single:                  HeadOfHousehold[];
      marriedFilingJointly:    HeadOfHousehold[];
      marriedFilingSeparately: HeadOfHousehold[];
      headOfHousehold:         HeadOfHousehold[];
  }
  
  interface HeadOfHousehold {
      rate: number | null;
      min:  number | null;
      max:  number | null;
  }
  
  interface StandardDeduction {
      single:                  number | null;
      marriedFilingJointly:    number | null;
      marriedFilingSeparately: number | null;
      headOfHousehold:         number | null;
  }

  export default class incometaxWrapper {
    constructor(options: incometaxOptions);

    execute(callback: (error: any, data: incometaxResponse | null) => void): Promise<incometaxResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: incometaxResponse | null) => void): Promise<incometaxResponse>;
    execute(query?: Record<string, any>): Promise<incometaxResponse>;
  }
}
