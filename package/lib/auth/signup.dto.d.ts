import { Language } from "@driveup/shared";
import { IDeviceAgent } from "../device/device.agent";
export declare class SignupDto {
    phone: string;
    otp: string;
    countryId: number;
    language: Language;
    device: IDeviceAgent;
}
