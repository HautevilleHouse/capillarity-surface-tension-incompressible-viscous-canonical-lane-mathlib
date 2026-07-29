import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure IncompressibleNavierStokesPackage where
  velocityField : Prop
  pressureField : Prop
  incompressibilityCondition : Prop
  viscousStressTensor : Prop
  momentumEquation : Prop

structure IncompressibleNavierStokesEvidence (N : IncompressibleNavierStokesPackage) where
  velocityFieldClosed : N.velocityField
  pressureFieldClosed : N.pressureField
  incompressibilityConditionClosed : N.incompressibilityCondition
  viscousStressTensorClosed : N.viscousStressTensor
  momentumEquationClosed : N.momentumEquation

def IncompressibleNavierStokesClosed (N : IncompressibleNavierStokesPackage) : Prop :=
  N.velocityField ∧ N.pressureField ∧
  N.incompressibilityCondition ∧ N.viscousStressTensor ∧
  N.momentumEquation

theorem incompressible_navier_stokes_closed_from_evidence
    (N : IncompressibleNavierStokesPackage) (E : IncompressibleNavierStokesEvidence N) :
    IncompressibleNavierStokesClosed N := by
  exact And.intro E.velocityFieldClosed
    (And.intro E.pressureFieldClosed
      (And.intro E.incompressibilityConditionClosed
        (And.intro E.viscousStressTensorClosed
          E.momentumEquationClosed)))

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse