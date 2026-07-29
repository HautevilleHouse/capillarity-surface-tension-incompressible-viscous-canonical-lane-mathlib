import CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.CapillarityAdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure NavierStokesPDEPackage where
  timeParameter : Type u
  velocityField : timeParameter → ℝ³
  pressureField : timeParameter → ℝ
  viscosity : ℝ
  incompressibilityCondition : Prop
  momentumEquation : Prop
  initialCondition : Prop

structure NavierStokesPDEEvidence (F : NavierStokesPDEPackage) where
  incompressibilityConditionClosed : F.incompressibilityCondition
  momentumEquationClosed : F.momentumEquation
  initialConditionClosed : F.initialCondition

def NavierStokesPDEClosed (F : NavierStokesPDEPackage) : Prop :=
  F.incompressibilityCondition ∧ F.momentumEquation ∧ F.initialCondition

theorem navier_stokes_pde_closed_from_evidence (F : NavierStokesPDEPackage)
    (E : NavierStokesPDEEvidence F) : NavierStokesPDEClosed F := by
  exact And.intro E.incompressibilityConditionClosed
    (And.intro E.momentumEquationClosed E.initialConditionClosed)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse