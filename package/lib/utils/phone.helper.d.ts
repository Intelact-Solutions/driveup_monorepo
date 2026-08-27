export declare class PhoneHelper {
    /**
     * Extracts the country code from a given phone number string.
     * @param phoneNumber - The phone number string to extract the country code from.
     * @param prefix - The prefix to prepend to the extracted country code. Default is '+'.
     * @returns The extracted country code with the specified prefix, or null if not found.
     */
    static extractCountryCode(phoneNumber: string, prefix?: string): string;
}
