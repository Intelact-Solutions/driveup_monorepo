import { AppointmentType, Role, StatusType } from "@driveup/shared";
import { Period } from "../calendar/date";
export declare class InstructorInviteDto {
    name: string;
    phone: string;
    role: Role;
}
export declare class InstructorFilterDto {
    phrase: string;
    statuses: StatusType[];
}
export declare class InstructorCalendarFilterDto {
    startDate: Date;
    endDate: Date;
    period: Period;
    types: AppointmentType[];
    instructors: number[];
    phrase: string;
}
