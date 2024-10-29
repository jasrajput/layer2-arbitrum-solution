import { Outlet } from 'react-router-dom';
import MainNavigation from "../components/mainNavigation";

export default function Root() {
    return (
        <>
            <MainNavigation />
            <Outlet />
        </>
    )
}