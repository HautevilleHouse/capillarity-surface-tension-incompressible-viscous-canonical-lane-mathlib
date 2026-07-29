import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure SurfaceTensionPDEPackage where
  velocityField : Type u
  pressureField : Type v
  interfacePosition : Type w
  surfaceTensionCoefficient : ℝ
  density : ℝ
  viscosity : ℝ
  youngLaplaceEquation : Prop
  incompressibilityCondition : Prop
  momentumEquation : Prop

structure SurfaceTensionPDEEvidence (P : SurfaceTensionPDEPackage) where
  youngLaplaceEquationClosed : P.youngLaplaceEquation
  incompressibilityConditionClosed : P.incompressibilityCondition
  momentumEquationClosed : P.momentumEquation

def SurfaceTensionPDEClosed (P : SurfaceTensionPDEPackage) : Prop :=
  P.youngLaplaceEquation ∧ P.incompressibilityCondition ∧ P.momentumEquation

theorem surface_tension_pde_closed_from_evidence (P : SurfaceTensionPDEPackage) (E : SurfaceTensionPDEEvidence P) :
    SurfaceTensionPDEClosed P := by
  exact And.intro E.youngLaplaceEquationClosed (And.intro E.incompressibilityConditionClosed E.momentumEquationClosed)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse