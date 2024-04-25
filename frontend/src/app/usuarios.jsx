import React from 'react'
import Sliderbar from '../components/sidebar'
import NavbarSystem from '../components/navabar'
import Table from './table'

const Users = () => {
  return (
    <>
        <header>
            <nav>
            <NavbarSystem />
            </nav>
        </header>
        <section>
            <Sliderbar />
            <Table></Table>
        </section>

    
    </>
  )
}

export default Users