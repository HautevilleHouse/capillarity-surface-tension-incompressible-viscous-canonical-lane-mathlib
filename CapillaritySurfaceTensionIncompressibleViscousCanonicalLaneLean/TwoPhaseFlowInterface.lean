import canonicalLaneMathlib.AdmissibleClass
import CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.CapillaritySurfaceTension
import CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.IncompressibleNavierStokes

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure TwoPhaseFlowInterfacePackage
    (C : CapillaritySurfaceTensionPackage) (N : IncompressibleNavierStokesPackage) where
  interfaceTrackingMethod : Prop
  curvatureRegularization : Prop
  surfaceTensionForce : Prop
  densityContrast : Prop
  viscosityContrast : Prop
  coupledSystemClosed : Prop

structure TwoPhaseFlowInterfaceEvidence
    {C : CapillaritySurfaceTensionPackage} {N : IncompressibleNavierStokesPackage}
    (T : TwoPhaseFlowInterfacePackage C N) where
  interfaceTrackingMethodClosed : T.interfaceTrackingMethod
  curvatureRegularizationClosed : T.curvatureRegularization
  surfaceTensionForceClosed : T.surfaceTensionForce
  densityContrastClosed : T.densityContrast
  viscosityContrastClosed : T.viscosityContrast
  coupledSystemClosed : T.coupledSystemClosed

def TwoPhaseFlowInterfaceClosed
    {C : CapillaritySurfaceTensionPackage} {N : IncompressibleNavierStokesPackage}
    (T : TwoPhaseFlowInterfacePackage C N) : Prop :=
  T.interfaceTrackingMethod ∧ T.curvatureRegularization ∧
  T.surfaceTensionForce ∧ T.densityContrast ∧
  T.viscosityContrast ∧ T.coupledSystemClosed

theorem two_phase_flow_interface_closed_from_evidence
    {C : CapillaritySurfaceTensionPackage} {N : IncompressibleNavierStokesPackage}
    (T : TwoPhaseFlowInterfacePackage C N) (E : TwoPhaseFlowInterfaceEvidence T) :
    TwoPhaseFlowInterfaceClosed T := by
  exact And.intro E.interfaceTrackingMethodClosed
    (And.intro E.curvatureRegularizationClosed
      (And.intro E.surfaceTensionForceClosed
        (And.intro E.densityContrastClosed
          (And.intro E.viscosityContrastClosed
            E.coupledSystemClosed))))

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse