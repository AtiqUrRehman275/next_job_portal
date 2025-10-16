"use server"

import { db } from "@/config/db";
import { users } from "@/drizzle/schema";
import argon2 from "argon2";


export const registrationAction = async (
    data: {
        name: string;
        userName: string;
        email: string;
        password: string;
        role: "applicant" | "employer";
    }
) => {

    try {
        const { name, userName, email, password, role } = data;

        const hashPassword = await argon2.hash(password)

        await db.insert(users).values({ name, userName, email, password: hashPassword, role });

        return {
            status: "SUCCESS",
            message: "Registration Completed Successfully"
        }
    }

    catch (error) {

        return {
            status: "ERROR",
            message: "Unknown Error Occorred! Please try again later"
        }
    }
}
/* (formData: FormData)*/
//{Object.fromEntries(formData.entries());
// console.log(Object.fromEntries(formData.entries()))}