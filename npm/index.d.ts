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
      year:               number | null;
      country:            null | string;
      type:               null | string;
      brackets:           Brackets;
      standardDeduction:  StandardDeductionClass;
      lastUpdated:        Date | null;
      marriagePenalty:    MarriagePenalty;
      effectiveRateCurve: EffectiveRateCurve;
      changes:            Changes;
  }
  
  interface Brackets {
      single:                  BracketsHeadOfHousehold[];
      marriedFilingJointly:    BracketsHeadOfHousehold[];
      marriedFilingSeparately: BracketsHeadOfHousehold[];
      headOfHousehold:         BracketsHeadOfHousehold[];
  }
  
  interface BracketsHeadOfHousehold {
      rate: number | null;
      min:  number | null;
      max:  number | null;
  }
  
  interface Changes {
      versusYear:        number | null;
      indexingPercent:   number | null;
      bracketShifts:     BracketShifts;
      standardDeduction: StandardDeduction;
  }
  
  interface BracketShifts {
      single:                  BracketShiftsHeadOfHousehold[];
      marriedFilingJointly:    BracketShiftsHeadOfHousehold[];
      marriedFilingSeparately: BracketShiftsHeadOfHousehold[];
      headOfHousehold:         BracketShiftsHeadOfHousehold[];
  }
  
  interface BracketShiftsHeadOfHousehold {
      rate:         number | null;
      from:         number | null;
      to:           number | null;
      shiftPercent: number | null;
  }
  
  interface StandardDeduction {
      single:                  StandardDeductionHeadOfHousehold;
      marriedFilingJointly:    StandardDeductionHeadOfHousehold;
      marriedFilingSeparately: StandardDeductionHeadOfHousehold;
      headOfHousehold:         StandardDeductionHeadOfHousehold;
  }
  
  interface StandardDeductionHeadOfHousehold {
      from:          number | null;
      to:            number | null;
      change:        number | null;
      changePercent: number | null;
  }
  
  interface EffectiveRateCurve {
      single:                  EffectiveRateCurveHeadOfHousehold[];
      marriedFilingJointly:    EffectiveRateCurveHeadOfHousehold[];
      marriedFilingSeparately: EffectiveRateCurveHeadOfHousehold[];
      headOfHousehold:         EffectiveRateCurveHeadOfHousehold[];
  }
  
  interface EffectiveRateCurveHeadOfHousehold {
      income:        number | null;
      taxableIncome: number | null;
      tax:           number | null;
      effectiveRate: number | null;
      marginalRate:  number | null;
  }
  
  interface MarriagePenalty {
      appliesFromRate: number | null;
      singleThreshold: number | null;
      jointThreshold:  number | null;
      jointShortfall:  number | null;
  }
  
  interface StandardDeductionClass {
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
