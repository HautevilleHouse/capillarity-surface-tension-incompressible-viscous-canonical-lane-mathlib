import CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.CapillaryAdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure CapillaryInterfacePackage where
  interfaceCurvature : Float
  surfaceTension : Float
  capillaryPressureJump : Float
  youngLaplaceEquation : Prop
  interfaceForceBalance : Prop

structure CapillaryInterfaceEvidence (C : CapillaryInterfacePackage) where
  youngLaplaceEquationClosed : C.youngLaplaceEquation
  interfaceForceBalanceClosed : C.interfaceForceBalance

def CapillaryInterfaceClosed (C : CapillaryInterfacePackage) : Prop :=
  C.youngLaplaceEquation ∧ C.interfaceForceBalance

theorem capillary_interface_closed_from_evidence
    (C : CapillaryInterfacePackage) (E : CapillaryInterfaceEvidence C) :
    CapillaryInterfaceClosed C := by
  exact And.intro E.youngLaplaceEquationClosed E.interfaceForceBalanceClosed

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse